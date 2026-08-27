@RestResource(urlMapping='/aos/execute/*')
global inherited sharing class AOS_RestBridge {

    @HttpPost
    global static String execute(String processor, String requestJSON) {
        if (String.isBlank(processor)) {
            return errorEnvelope('No processor specified.');
        }
        try {
            return aos_CommonCtrl.execute(processor, requestJSON);
        } catch (Exception e) {
            return errorEnvelope(e.getTypeName() + ': ' + e.getMessage());
        }
    }

    /**
     * Shapes unexpected failures like a normal processor response, so the
     * React client has a single parse path instead of two.
     */
    private static String errorEnvelope(String message) {
        return JSON.serialize(new Map<String, Object>{
            'isValid' => false,
            'errors'  => new List<String>{ message }
        });
    }
}