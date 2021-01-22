package com.sagape.dockercassandrademo;

import com.sagape.dockercassandrademo.util.LoggingTestWatcher;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;


@ExtendWith(LoggingTestWatcher.class)
public class SimpleTestIT {

    @Test
    public void simple_should_pass() {
        Assertions.assertEquals(123, 123);
    }
}
