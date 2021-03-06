/**
 * Class AccountHandler
 *
 * Trigger Handler for the Account SObject. This class implements the ITrigger
 * interface to help ensure the trigger code is bulkified and all in one place...
 * Commit done by Venkat - TechM.
 * Second commit done by Venkat.
 * TechMInternal user commit.
 */
public with sharing class AccountHandler implements ITrigger
{	
	// Member variable to hold the Id's of Accounts 'in use'
	private Set<Id> m_inUseIds = new Set<Id>();
	
	// Member variable to record Audit records

	
	// Constructor
	public AccountHandler()
	{
	}

	/**
	 * bulkBefore
	 *
	 * This method is called prior to execution of a BEFORE trigger. Use this to cache
	 * any data required into maps prior execution of the trigger.
	 */
	public void bulkBefore()
	{
		// If this a delete trigger Cache a list of Account Id's that are 'in use'
		if (Trigger.isDelete)
		{
			// pre load all the in use projects passed to this trigger

		}
	}
	
	public void bulkAfter()
	{
	}
		
	public void beforeInsert(SObject so)
	{
	}
	
	public void beforeUpdate(SObject oldSo, SObject so)
	{
	}
	
	/**
	 * beforeDelete
	 *
	 * This method is called iteratively for each record to be deleted during a BEFORE
	 * trigger.
	 */
	public void beforeDelete(SObject so)
	{	
		// Cast the SObject to an Account
		Account myAccount = (Account)so;
		
		// Examine the Set and if the account is in use don't allow it to be deleted.	
		if (m_inUseIds.contains(myAccount.Id))
		{
			// Add the error to the offending object
			so.addError('You cannot delete an Account that is in use.');
		}
		else
		{
		}
	}
	
	public void afterInsert(SObject so)
	{
	}
	
	public void afterUpdate(SObject oldSo, SObject so)
	{
	}
	
	public void afterDelete(SObject so)
	{
	}
	
	/**
	 * andFinally
	 *
	 * This method is called once all records have been processed by the trigger. Use this 
	 * method to accomplish any final operations such as creation or updates of other records.
	 */
	public void andFinally()
	{
		
	}
}