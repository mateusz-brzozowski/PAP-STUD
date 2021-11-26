package edu.iipw.pap;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.geometry.Insets;
import javafx.scene.control.Button;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.CornerRadii;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;

public class Controller {
    @FXML
    private Button btnAddAgency;

    @FXML
    private Button btnAddLine;

    @FXML
    private Button btnAddStop;

    @FXML
    private Button btnAgency;

    @FXML
    private Button btnLine;

    @FXML
    private Button btnRemoveAgency;

    @FXML
    private Button btnRemoveLine;

    @FXML
    private Button btnRemoveStop;

    @FXML
    private Button btnSearchAgency;

    @FXML
    private Button btnSearchLine;

    @FXML
    private Button btnSearchStop;

    @FXML
    private Button btnStop;

    @FXML
    private Pane plnStatus;

    @FXML
    private GridPane pnAgency;

    @FXML
    private GridPane pnLine;

    @FXML
    private GridPane pnStop;

    @FXML
    private Text textHeader;

    @FXML
    void onAddAgency(ActionEvent event) {

    }

    @FXML
    void onAddLine(ActionEvent event) {

    }

    @FXML
    void onAddStop(ActionEvent event) {

    }

    @FXML
    void onAgency(ActionEvent event) {
        textHeader.setText("Agencies");
        plnStatus.setBackground(new Background(new BackgroundFill(Color.rgb(8, 83, 163), CornerRadii.EMPTY, Insets.EMPTY)));
        pnAgency.toFront();
    }

    @FXML
    void onLine(ActionEvent event) {
        textHeader.setText("Lines");
        plnStatus.setBackground(new Background(new BackgroundFill(Color.rgb(60, 147, 240), CornerRadii.EMPTY, Insets.EMPTY)));
        pnLine.toFront();
    }

    @FXML
    void onRemoveAgency(ActionEvent event) {

    }

    @FXML
    void onRemoveLine(ActionEvent event) {

    }

    @FXML
    void onRemoveStop(ActionEvent event) {

    }

    @FXML
    void onSearchAgency(ActionEvent event) {

    }

    @FXML
    void onSearchLine(ActionEvent event) {

    }

    @FXML
    void onSearchStop(ActionEvent event) {

    }

    @FXML
    void onStop(ActionEvent event) {
        textHeader.setText("Stops");
        plnStatus.setBackground(new Background(new BackgroundFill(Color.rgb(163, 112, 24), CornerRadii.EMPTY, Insets.EMPTY)));
        pnStop.toFront();
    }

}
