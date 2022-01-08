package edu.iipw.pap;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.util.Arrays;
import java.util.Set;

import org.junit.jupiter.api.Test;

import edu.iipw.pap.db.model.Pattern;
import edu.iipw.pap.db.model.PatternDirection;
import edu.iipw.pap.db.model.PatternStop;
import edu.iipw.pap.db.model.Trip;
import edu.iipw.pap.exceptions.InvalidData;

public class TestsPattern {
    Pattern preparePattern() {
        Pattern p = new Pattern();
        p.setHeadsign("Młociny");
        p.setDirection(PatternDirection.OUTBOUND);
        p.setLine(Dataset.INSTANCE.lineM1);
        return p;
    }

    PatternStop[] preparePatternStops(Pattern p) {
        PatternStop[] ps = { new PatternStop(), new PatternStop(), new PatternStop() };
        ps[0].setPattern(p);
        ps[0].setStop(Dataset.INSTANCE.stopKabaty);
        ps[0].setIndex(0);
        ps[0].setTravelTime(0);

        ps[1].setPattern(p);
        ps[1].setStop(Dataset.INSTANCE.stopSwietokrzyska);
        ps[1].setIndex(1);
        ps[1].setTravelTime(1320);

        ps[2].setPattern(p);
        ps[2].setStop(Dataset.INSTANCE.stopMlociny);
        ps[2].setIndex(2);
        ps[2].setTravelTime(2340);

        p.setPatternStops(Arrays.asList(ps));
        return ps;
    }

    @Test
    void checkValidateUserInput() {
        Pattern p = preparePattern();
        PatternStop[] ps = preparePatternStops(p);

        // Check against a valid pattern
        assertDoesNotThrow(() -> p.validateUserInput());

        // Validate line checking
        p.setLine(null);
        assertThrows(InvalidData.class, () -> p.validateUserInput());
        p.setLine(Dataset.INSTANCE.lineM1);

        // Validate direction checking
        p.setDirection(null);
        assertThrows(InvalidData.class, () -> p.validateUserInput());
        p.setDirection(PatternDirection.OUTBOUND);

        // Validate unique indices checking
        ps[0].setIndex(2);
        assertThrows(InvalidData.class, () -> p.validateUserInput());
        ps[0].setIndex(0);

        // Validate first time checking
        ps[0].setTravelTime(60);
        assertThrows(InvalidData.class, () -> p.validateUserInput());
        ps[0].setTravelTime(0);

        // Validate time-travel checking
        ps[2].setTravelTime(600);
        assertThrows(InvalidData.class, () -> p.validateUserInput());
        ps[2].setTravelTime(2340);

        // Validate recursive checking of pattern-stops
        ps[0].setStop(null);;
        assertThrows(InvalidData.class, () -> p.validateUserInput());
        ps[0].setStop(Dataset.INSTANCE.stopKabaty);

        // Validate recursive checking of trips
        p.setTrips(Set.of(new Trip()));
        assertThrows(InvalidData.class, () -> p.validateUserInput());
    }
}
