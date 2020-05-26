public with sharing class CaseController {
    public CaseController() {

    }

    @AuraEnabled
public static List<case> createCaseRecords(List<Case> caseRecords, string recordId){
  
    SYSTEM.DEBUG(recordId);

    List<Case> cs = [Select AccountId, ContactId from Case where Id = : recordId];

    if(!cs.isEmpty()){
        for(Case c:caseRecords){
c.AccountId = cs[0].AccountId;
c.ContactId = cs[0].ContactId;
        }
    }
  insert caseRecords;
      System.debug(caseRecords);

      List<string> lstCaseIds = new List<String>();

      for(Case c:caseRecords){
        lstCaseIds.add(c.Id);

      }
      List<case> lstCases = [select Id, caseNumber from case where Id in :lstCaseIds];
  return lstCases;
}
}