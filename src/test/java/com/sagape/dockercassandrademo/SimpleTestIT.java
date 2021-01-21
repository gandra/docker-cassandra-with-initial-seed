package com.sagape.dockercassandrademo;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class SimpleTestIT {

    @Test
    public void simple_should_pass() {
        Assertions.assertEquals("aaa", "aaa");
    }
}
