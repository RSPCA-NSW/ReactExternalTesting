@IsTest
private class AOS_RestBridgeTest {

    @IsTest
    static void blankProcessorReturnsError() {
        Test.startTest();
        String result = AOS_RestBridge.execute(null, '{}');
        Test.stopTest();

        Map<String, Object> parsed =
            (Map<String, Object>) JSON.deserializeUntyped(result);
        Assert.isFalse((Boolean) parsed.get('isValid'));
    }

    @IsTest
    static void unknownProcessorIsHandled() {
        Test.startTest();
        String result = AOS_RestBridge.execute('NoSuchProcessor', '{}');
        Test.stopTest();

        Assert.isNotNull(result, 'Bridge should always return a response body.');
    }
}