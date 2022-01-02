package edu.iipw.pap.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import edu.iipw.pap.db.Database;
import edu.iipw.pap.db.model.Calendar;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class AddCalendarController {
    @FXML
    private Button btnCalenarOk;

    @FXML
    private CheckBox checkFriday;

    @FXML
    private CheckBox checkMonday;

    @FXML
    private CheckBox checkSaturday;

    @FXML
    private CheckBox checkSunday;

    @FXML
    private CheckBox checkThusday;

    @FXML
    private CheckBox checkTuesday;

    @FXML
    private CheckBox checkWednesday;

    @FXML
    private TextField txtCalendarEnd;

    @FXML
    private Text txtCalendarError;

    @FXML
    private TextField txtCalendarName;

    @FXML
    private TextField txtCalendarStart;

    @FXML
    void onCalendarOk(ActionEvent event) throws Exception {
        try {
            String startDateStr = txtCalendarStart.getText();
            LocalDate startDate = startDateStr == null ? null : LocalDate.parse(startDateStr, DateTimeFormatter.ISO_LOCAL_DATE);

            String endDateStr = txtCalendarEnd.getText();
            LocalDate endDate = endDateStr == null ? null : LocalDate.parse(endDateStr, DateTimeFormatter.ISO_LOCAL_DATE);


            var calendar = new Calendar(
                txtCalendarName.getText(),
                startDate,
                endDate,
                checkMonday.isSelected(),
                checkTuesday.isSelected(),
                checkWednesday.isSelected(),
                checkThusday.isSelected(),
                checkFriday.isSelected(),
                checkSaturday.isSelected(),
                checkSunday.isSelected()
            );
            Database.add(calendar);
        } catch (Exception e) {
            txtCalendarError.setText(e.toString());
        }
        Stage stage = (Stage) btnCalenarOk.getScene().getWindow();
        stage.close();
    }
}
