package edu.iipw.pap.controller;

import java.net.URL;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ResourceBundle;

import edu.iipw.pap.db.Database;
import edu.iipw.pap.db.model.Stop;
import edu.iipw.pap.exceptions.InvalidObject;
import edu.iipw.pap.interfaces.IController;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Spinner;
import javafx.scene.control.SpinnerValueFactory;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.util.StringConverter;

/**
 * Controller for the "create stop" popup
 */
public class EditStopController implements Initializable, IController {

    /**
     * The OK button in the popup
     */
    @FXML
    private Button btnStopOk;

    /**
     * Text box to display any errors that might occur
     * when adding a stop to the database.
     */
    @FXML
    private Text txtStopError;

    /**
     * The tri-state checkbox representing wheelchair accessibility
     * of the created stop.
     */
    @FXML
    private CheckBox checkStopWheelchairAccessible;

    /**
     * Input field for the stop name
     */
    @FXML
    private TextField txtStopName;

    /**
     * Input field for the stop code
     */
    @FXML
    private TextField txtStopCode;

    /**
     * Input field for the latitude of the stop
     */
    @FXML
    private Spinner<Double> spinStopLat;

    /**
     * Input field for the longitude of the stops
     */
    @FXML
    private Spinner<Double> spinStopLon;

    /**
     * latLonConverter is an object used by both spinners
     * to convert the user input into a Double.
     * Accepts up to six decimal digits.
     */
    private final StringConverter<Double> latLonConverter = new StringConverter<Double>() {
        private final DecimalFormat df = new DecimalFormat("#.######");

        @Override
        public String toString(Double value) {
            return value == null ? "" : df.format(value);
        }

        @Override
        public Double fromString(String value) {
            try {
                // If the specified value is null or zero-length, return null
                if (value == null) {
                    return null;
                }
                value = value.trim();
                if (value.length() < 1) {
                    return null;
                }

                // Perform the requested parsing
                return df.parse(value).doubleValue();
            } catch (ParseException ex) {
                throw new RuntimeException(ex);
            }
        }
    };

    /**
     * latInputFactory is the SpinnerValueFactory used by the * latitude input
     * spinner
     */
    private SpinnerValueFactory<Double> latInputFactory = new SpinnerValueFactory.DoubleSpinnerValueFactory(
            -90.0,
            90.0,
            0,
            0.0001);

    /**
     * lonInputFactory is the SpinnerValueFactory used by the longitude input
     * spinner
     */
    private SpinnerValueFactory<Double> lonInputFactory = new SpinnerValueFactory.DoubleSpinnerValueFactory(
            -180.0,
            180.0,
            0,
            0.0001);

    /**
     * Event handler for the OK button
     *
     * @param event
     * @throws Exception
     */
    @FXML
    void onStopOk(ActionEvent event) throws Exception {
        try {
            stop_.validateUserInput();
        } catch (Exception e) {
            this.txtStopError.setText(e.toString());
            return;
        }
        Database.INSTANCE.save(stop_);

        Stage stage = (Stage) btnStopOk.getScene().getWindow();
        stage.close();
    }

    /**
     * Initializes the controller by setting up all of the GUI elements.
     */
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // Set up the ValueConverters for spinner value factories
        latInputFactory.setConverter(latLonConverter);
        lonInputFactory.setConverter(latLonConverter);

        // Attach spinner value factories to the spinner gui elements
        spinStopLat.setValueFactory(latInputFactory);
        spinStopLon.setValueFactory(lonInputFactory);
    }

    /**
     * Stop that is being edited
     */
    private Stop stop_;

    /**
     * Setting object to edit and binding properties
     */
    @Override
    public <T> void setObject(T obj) throws InvalidObject {
        if (Stop.class.isInstance(obj)) {
            this.stop_ = (Stop) obj;
            this.txtStopName.textProperty().bindBidirectional(this.stop_.nameProperty());
            this.txtStopCode.textProperty().bindBidirectional(this.stop_.codeProperty());
            this.spinStopLat.getValueFactory().valueProperty().bindBidirectional(this.stop_.latProperty().asObject());
            this.spinStopLon.getValueFactory().valueProperty().bindBidirectional(this.stop_.lonProperty().asObject());

            WheelchairAccessibilityMux wam = new WheelchairAccessibilityMux();
            wam.accessibleProperty().set(this.stop_.getWheelchairAccessible());

            this.stop_.wheelchairAccessibleProperty().bindBidirectional(wam.accessibleProperty());
            this.checkStopWheelchairAccessible.selectedProperty().bindBidirectional(wam.checkedProperty());
            this.checkStopWheelchairAccessible.indeterminateProperty().bindBidirectional(wam.indeterminateProperty());
        } else {
            throw new InvalidObject("Niepoprawny obiekt");
        }

    }

}
