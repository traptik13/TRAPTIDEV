public class DemoClass {
    public List<String> getClosedWonOpportunityNames() {
        List<String> str=new List<String>();
        List<Opportunity> oppList=[Select id,Name,AccountId,CloseDate,StageName from Opportunity where StageName = 'Closed Won' and AccountId != null];
        for(Opportunity oppObj:oppList){
            String s= oppObj.Name;
            str.add(s);
        }
    System.debug('Opportunity Name is: '+ str );
    return str;
	}
}