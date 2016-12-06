@isTest
private class WaveDemoLoadSobjectsTest {
    @isTest static void testGetS3EeventFileCallout() {
	    // Set mock callout class 
	    Test.setMock(HttpCalloutMock.class, new TestResponseGenerator());
        HttpRequest req = new HttpRequest();

	    // This causes a fake response to be sent
	    // from the class that implements HttpCalloutMock. 
	    HttpResponse response = WaveDemoLoadSobjects.S3EeventFileCallout('Default-ContentTransferWithUsers.csv');

	    // Verify that the response received contains fake values
	    String contentType = response.getHeader('Content-Type');
	    System.assert(contentType == 'application/octet-stream');
	    String actualValue = response.getStatus();
	    System.debug(response.getStatus());
	    String expectedValue = 'OK';
	    System.assertEquals(actualValue, expectedValue);
	    System.assertEquals(200, response.getStatusCode());
    }
        
	@isTest static void testBaseUrlCallout() {
        System.debug('In testBaseUrlCallout()...');
	    // Set mock callout class 
	    Test.setMock(HttpCalloutMock.class, new TestResponseGenerator());
        HttpRequest req = new HttpRequest();

	    // This causes a fake response to be sent
	    // from the class that implements HttpCalloutMock.
	    HttpResponse response = WaveDemoLoadSobjects.baseUrlCallout('https://na0.salesforce.com', 'session123');

	    // Verify that the response received contains fake values
	    String contentType = response.getHeader('Content-Type');
	    System.assert(contentType == 'text/plain');
	    String actualValue = response.getBody();
	    System.debug(response.getBody());
	    String expectedValue = '';
	    System.assertEquals(actualValue, expectedValue);
	    System.assertEquals(200, response.getStatusCode());
	}

	@isTest static void testCreateJobCallout() {
	    // Set mock callout class 
	    Test.setMock(HttpCalloutMock.class, new TestResponseGenerator());
        HttpRequest req = new HttpRequest();

	    // This causes a fake response to be sent
	    // from the class that implements HttpCalloutMock. 
	    HttpResponse response = WaveDemoLoadSobjects.createJobCallout('https://na0.salesforce.com', 'session123', 'insert', 'ContentTransferWithUsers');

	    // Verify that the response received contains fake values
	    String contentType = response.getHeader('Content-Type');
	    System.assert(contentType == 'application/xml');
	    String actualValue = response.getStatus();
	    System.debug(response.getStatus());
	    String expectedValue = 'Created';
	    System.assertEquals(actualValue, expectedValue);
	    System.assertEquals(200, response.getStatusCode());
	}
    
    @isTest static void testCreateBatchCallout() {
	    // Set mock callout class 
	    Test.setMock(HttpCalloutMock.class, new TestResponseGenerator());
        HttpRequest req = new HttpRequest();

	    // This causes a fake response to be sent
	    // from the class that implements HttpCalloutMock. 
	    HttpResponse response = WaveDemoLoadSobjects.createBatchCallout('https://na0.salesforce.com', 'session123', 
                                                                        'job-XYZ123', 'ContentTransferWithUsers', 
                                                                        Blob.valueof('val1,va2,val3'));

	    // Verify that the response received contains fake values
	    String contentType = response.getHeader('Content-Type');
	    System.assert(contentType == 'application/xml');
	    String actualValue = response.getStatus();
	    System.debug(response.getStatus());
	    String expectedValue = 'Created';
	    System.assertEquals(actualValue, expectedValue);
	    System.assertEquals(200, response.getStatusCode());
    }
        
    @isTest static void testCloseJobCallout() {
	    // Set mock callout class 
	    Test.setMock(HttpCalloutMock.class, new TestResponseGenerator());
        HttpRequest req = new HttpRequest();

	    // This causes a fake response to be sent
	    // from the class that implements HttpCalloutMock. 
	    HttpResponse response = WaveDemoLoadSobjects.closeJobCallout('https://na0.salesforce.com', 'session123', 'job-XYZ123');

	    // Verify that the response received contains fake values
	    String contentType = response.getHeader('Content-Type');
	    System.assert(contentType == 'application/xml');
	    String actualValue = response.getStatus();
	    System.debug(response.getStatus());
	    String expectedValue = 'OK';
	    System.assertEquals(actualValue, expectedValue);
	    System.assertEquals(200, response.getStatusCode());
    }
}