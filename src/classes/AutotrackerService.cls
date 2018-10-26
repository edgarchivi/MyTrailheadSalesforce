public with sharing class AutotrackerService {

	@AuraEnabled
    public static ServiceData GetData(String customerId) {
		return new AutotrackerService().getServiceData(customerId);
    }

	public ServiceData getServiceData(String customerId) {
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://zuorasandbox.daysmart.com/customer-dashboard?CustomerId='+customerId);
		request.setMethod('GET');
		HttpResponse response = http.send(request);
		ServiceData serviceData;
		if (response.getStatusCode() == 200) {
			String jsonInput = response.getBody();
			jsonInput = jsonInput.replace('"Date":', '"ActivityDate":');
			serviceData = (ServiceData)JSON.deserialize(jsonInput, ServiceData.class); 
		}

		System.debug(serviceData.customerDashboardData.SubscriptionSettings[0].BilledThroughZuora);
 		System.debug(serviceData.customerDashboardData.Trials[0].TrialStartDate);
 		System.debug(serviceData.customerDashboardData.Trials[0].Edition);

		return serviceData;
	}

	public class ServiceData {
		public DashboardData customerDashboardData {get;set;}
	}

	public class DashboardData{
		public Integer Id {get;set;}
		public Integer MessagingActive {get;set;}
		public Integer RemoteActive {get;set;}
		public Integer OnlineBookingActive {get;set;}

		public List<cSubscriptionSettings> SubscriptionSettings {get;set;}
		public List<cTrial> Trials {get;set;}
		public List<cUsers> Users {get;set;}
		public List<cActivities> Activity {get;set;}
	}

	public class cSubscriptionSettings {
        public Boolean BilledThroughZuora {get;set;}
        public Boolean IsWinformOneTimePurchase {get;set;}
        public Boolean IsCloudSubscriptionActive {get;set;}
        public Boolean IsWinformSubscriptionActive {get;set;}
        public string SubscriptionEdition {get;set;}
	}

	public class cTrial {
		public string TrialType{get;set;}
        public DateTime TrialStartDate {get;set;}
        public DateTime TrialEndDate {get;set;}
        public string TrialStatus {get;set;}
        public string Edition {get;set;}
        // public DateTime WinformTrialDateActivated{get;set;}
        // public DateTime TrialDateCreated {get;set;}
    }

	public class cUsers{
		public cUser Users {get;set;}
	}

	public class cUser {
		public string Email {get;set;}
        public Boolean Admin {get;set;}
        public Boolean RA {get;set;}
        public Boolean OLB {get;set;}
	}
	
	public class cActivities {
		public cActivity Activity { get; set; }

	}
	public class cActivity {
        public string Email {get;set;}
        public DateTime ActivityDate {get;set;}
        public string Activity {get;set;}
        public string ActivitySubType {get;set;}

	}

}