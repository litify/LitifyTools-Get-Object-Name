@ isTest
public class GetObjectNameTest {
	@isTest
	public static void testReturnObjectName() {

		//Create and insert lead record
		Lead testLead = new Lead();
		testLead.Status = 'Open';
		testLead.Salutation = 'Mr.';
		testLead.FirstName = 'Tim';
		testLead.LastName = 'Testin';
		testLead.Company = 'Test Company';
		insert testLead;

		//Return newly created lead record
		List<Lead> LeadList = new List<Lead>();
		LeadList = [Select Id from Lead where FirstName = 'Tim' AND LastName = 'Testin' AND Company = 'Test Company' LIMIT 1];

		List<Id> IdList = new List<Id>();

		For (Lead l :LeadList) {
			IdList.add(l.Id);
		}

        //start test
        test.startTest();       
		List<String> results = new List<String>();
        results = GetObjectName.returnObjectName(IdList);    
        test.stopTest();
        
        //check for correct value
		System.assertEquals('Lead', results [0], 'ERROR IN GetObjectNameTest.testReturnObjectName : sObject Name did not match');

	}

}