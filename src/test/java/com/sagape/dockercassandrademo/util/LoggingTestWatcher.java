package com.sagape.dockercassandrademo.util;

import org.junit.jupiter.api.extension.ExtensionContext;
import org.junit.jupiter.api.extension.TestWatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggingTestWatcher implements TestWatcher {

    private Logger logger = LoggerFactory.getLogger (LoggingTestWatcher.class);

    @Override
    public void	testAborted (ExtensionContext context, Throwable cause) {
        System.out.println("test aborted: "+context.getDisplayName ());
    }


    @Override
    public void	testFailed (ExtensionContext context, Throwable cause) {
        System.out.println ("test failed: "+context.getDisplayName ());
    }

    @Override
    public void testSuccessful(ExtensionContext context) {
        System.out.println ("test Successful: "+context.getDisplayName ());
    }
}
