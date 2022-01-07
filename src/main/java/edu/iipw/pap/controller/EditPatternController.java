package edu.iipw.pap.controller;

import java.net.URL;
import java.util.ResourceBundle;
import java.util.ArrayList;
import edu.iipw.pap.db.model.PatternStop;
import edu.iipw.pap.db.model.Pattern;
import edu.iipw.pap.db.model.PatternDirection;
import edu.iipw.pap.db.model.Trip;
import edu.iipw.pap.interfaces.IController;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class EditPatternController implements Initializable, IController {
    @FXML
    private Button btnPatternOk;

    @FXML
    private ChoiceBox<PatternDirection> choiceDirection;

    @FXML
    private ListView<PatternStop> listPatternStop;

    @FXML
    private ListView<Trip> listTrip;

    @FXML
    private TextField txtLineHeadsign;

    @FXML
    private Text txtPatternError;

    private Pattern pattern_;

    @Override
    public <T> void setObject(T obj) throws Exception {
        if(Pattern.class.isInstance(obj)) {
            this.pattern_ = (Pattern) obj;

            this.txtLineHeadsign.textProperty().bindBidirectional(this.pattern_.headsignProperty());

            this.choiceDirection.valueProperty().bindBidirectional(this.pattern_.directionProperty());

            this.listPatternStop.itemsProperty().bindBidirectional(this.pattern_.patternStopsProperty());

            this.listTrip.getItems().setAll(new ArrayList<Trip>(this.pattern_.tripsProperty()));

            if(pattern_.patternStopsProperty().get() == null)
            {
                pattern_.setPatternStops(FXCollections.observableArrayList());
            }

        }
        else {
            // FIXME: wlasny wyjatek
            throw new Exception("dupa");
        }
    }

    @FXML
    void onNewPatternStop(ActionEvent event) {
        PatternStop patternStop = new PatternStop();
        patternStop.setPattern(this.pattern_);
        listPatternStop.getItems().add(patternStop);
        this.pattern_.refreshIndices();
    }

    @FXML
    void onNewTrip(ActionEvent event) {
        Trip trip = new Trip();
        trip.setPattern(this.pattern_);
        listTrip.getItems().add(trip);
    }

    @FXML
    void onPatternOk(ActionEvent event) throws Exception{
        try {
            // List<PatternStop> patternStops = listPatternStop.getItems();
            // pattern_.setPatternStops(patternStops);
            System.out.println(pattern_.directionProperty());
            System.out.println(pattern_.headsignProperty());
            System.out.println(pattern_.patternStopsProperty());
        }
        catch (Exception e) {
            txtPatternError.setText(e.toString());
        }
        Stage stage = (Stage) btnPatternOk.getScene().getWindow();
        stage.close();
    }


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        choiceDirection.getItems().setAll(PatternDirection.values());
        listPatternStop.setCellFactory(param -> new PatternStopCellController());

        listTrip.setCellFactory(param -> new TripCellControler());
    }
}