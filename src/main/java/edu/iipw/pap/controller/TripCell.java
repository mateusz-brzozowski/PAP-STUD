package edu.iipw.pap.controller;

import edu.iipw.pap.db.model.Trip;
import javafx.scene.control.ListCell;

/**
 * TripCellController is responsible for view of trips in pattern
 */
public class TripCell extends ListCell<Trip> {
    @Override
    public void updateItem(Trip trip, boolean empty) {
        super.updateItem(trip, empty);
        if (trip != null) {
            TripCellController tripCell = new TripCellController();
            try {
                tripCell.setObject(trip);
                tripCell.setObject(this.listViewProperty().get());
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            setGraphic(tripCell.getHboxRoot());
        }
    }
}
