public with sharing class RandomContactFactory {
	public RandomContactFactory() {
		
	}

	public static List<Contact> generateRandomContacts(integer qtyContacts, string lastName){
		integer x = 1;
		integer y  = qtyContacts;

		double randomNumber;
		List<Contact> contacts = new List<Contact>();
		for(integer i = 0; i<qtyContacts; i++){
 			randomNumber = Math.floor(Math.random() * ((y-x)+1) + x);
			contacts.Add(new Contact(FirstName ='Name'+randomNumber , LastName = lastName));
		}
		
		return contacts;

	}

}