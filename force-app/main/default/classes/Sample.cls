public class Sample
{
    public List<Custom1__c> code { get; set; }
    public Map<String, Schema.SObjectField> fieldMap { get; set; }

    public Sample()
    {
        Map<String, Custom1__c> allCodes = Custom1__c.getAll();
        code = allCodes.values();

        fieldMap = Custom1__c.SObjectType.getDescribe().fields.getMap();

        for (String fieldName : fieldMap.keySet())
        {
            System.debug('Field: ' + fieldName);
        }
    }
}