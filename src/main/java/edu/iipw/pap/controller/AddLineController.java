package edu.iipw.pap.controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import java.util.Set;
import java.util.HashSet;

import edu.iipw.pap.db.Database;
import edu.iipw.pap.db.model.Agency;
import edu.iipw.pap.db.model.Pattern;
import edu.iipw.pap.db.model.PatternDirection;
import edu.iipw.pap.db.model.Line;
import edu.iipw.pap.db.model.LineType;
import edu.iipw.pap.interfaces.IController;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.chart.PieChart.Data;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.scene.control.cell.PropertyValueFactory;

public class AddLineController implements Initializable, IController {
    @FXML
    private Button btnAddPattern;

    @FXML
    private Button btnLineOk;

    @FXML
    private ChoiceBox<Agency> choiceLineAgency;

    @FXML
    private ChoiceBox<LineType> choiceLineType;

    @FXML
    private TableColumn<Pattern, PatternDirection> colPatternDirection;

    @FXML
    private TableColumn<Pattern, String> colPatternHeadsign;

    @FXML
    private TableColumn<Pattern, Integer> colPatternId;

    @FXML
    private TableView<Pattern> tblPattern;

    @FXML
    private TextField txtLineCode;

    @FXML
    private TextField txtLineDescription;

    @FXML
    private Text txtStopError;

    private Line line_;

    @Override
    public <T> void setObject(T obj) throws Exception {
        if (Line.class.isInstance(obj)) {
            this.line_ = (Line) obj;
            InitializePatternTable();
            this.txtLineCode.textProperty().bindBidirectional(this.line_.codeProperty());
            this.txtLineDescription.textProperty().bindBidirectional(this.line_.descriptionProperty());
            this.choiceLineAgency.valueProperty().bindBidirectional(this.line_.agencyProperty());
            this.choiceLineType.valueProperty().bindBidirectional(this.line_.typeProperty());
        } else {
            // FIXME: wlasny wyjatek
            throw new Exception("błąd");
        }

    }

    @FXML
    void onAddPattern(ActionEvent event) throws Exception {
        // FIXME: no tego tu nie powinno być, trzeba dać jakaś referencje do referencji
        // na referencji
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/view/addPattern.fxml"));
        VBox page = (VBox) loader.load();
        Stage stage = new Stage();
        stage.setScene(new Scene(page));
        stage.initModality(Modality.WINDOW_MODAL);
        stage.initOwner(btnAddPattern.getScene().getWindow());
        IController controller = loader.getController();
        Pattern pattern = new Pattern();
        pattern.setLine(line_);
        // rozwiązanie tymczasowe
        var linePatterns = line_.patternsProperty();
        if (linePatterns.get() == null) {
            line_.setPatterns(new HashSet<Pattern>());
        }
        linePatterns.add(pattern);
        // line_.getPatterns().add(pattern);
        controller.setObject(pattern);
        stage.showAndWait();
        refreshPatterns();
    }

    // TODO: wyświetlanie listy patternów
    private void refreshPatterns() {
        if (!(this.line_.patternsProperty() == null))
            tblPattern.getItems().setAll(this.line_.patternsProperty());
    }

    public void InitializePatternTable() {
        colPatternDirection.setCellValueFactory(new PropertyValueFactory<Pattern, PatternDirection>("direction"));
        colPatternHeadsign.setCellValueFactory(new PropertyValueFactory<Pattern, String>("headsign"));
        colPatternId.setCellValueFactory(new PropertyValueFactory<Pattern, Integer>("patternId"));
        refreshPatterns();
    }

    @FXML
    void onEditPattern(ActionEvent event) {

    }

    @FXML
    void onLineOk(ActionEvent event) throws Exception {
        try {
            // Line line = new Line();
            // line.setCode(txtLineCode.getText());
            // line.setDescription(txtLineDescription.getText());
            // line.setType(choiceLineType.getValue());
            // line.setAgency(choiceLineAgency.getValue());
            Database.INSTANCE.save(line_);
        } catch (Exception e) {
            txtStopError.setText(e.toString());
        }
        Stage stage = (Stage) btnLineOk.getScene().getWindow();
        stage.close();
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        choiceLineType.getItems().setAll(LineType.values());
        choiceLineAgency.getItems().setAll(Database.INSTANCE.listAll(Agency.class));
    }

    @FXML
    void onRemovePattern(ActionEvent event) {
        // FIXME: nie działa
        Pattern patternToRemove = tblPattern.getSelectionModel().getSelectedItem();
        line_.patternsProperty().remove(patternToRemove);
        Database.INSTANCE.delete(patternToRemove);
        Database.INSTANCE.save(line_);
        refreshPatterns();
    }

    @FXML
    void onSearchPattern(ActionEvent event) {

    }

}
