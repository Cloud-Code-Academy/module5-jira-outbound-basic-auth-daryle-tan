/**
 * Service class for making callouts to the Jira API
 */
public with sharing class JiraAPIService {
	/**
	 * Creates a project in Jira
	 * @param projectWrapper The project wrapper object containing all necessary data
	 * @return String The Jira project ID
	 *
	 * TODO: Implement this method to make a callout to Jira API to create a project
	 * Reminder: Extract and return the project ID from the response
	 */
	public static String createProject(JiraWrapper.ProjectWrapper projectWrapper) {
		Http http = new Http();
		HttpRequest req = new HttpRequest();
		req.setEndpoint('callout:jiraAPI'); // TODO: may need to add to endpoint
		req.setMethod('POST');
		req.setHeader('Content-Type', 'application/json');

		Map<String, Object> projectPayload = new Map<String, Object>{
			'key' => projectWrapper.key,
			'name' => projectWrapper.name,
			'projectTypeKey' => 'software',
			'projectTemplateKey' => projectWrapper.projectTemplateKey,
			'description' => projectWrapper.description,
			'leadAccountId' => projectWrapper.leadAccountId
		};
		req.setBody(JSON.serialize(projectPayload));
		
		try {
			HttpResponse res = http.send(req);
			if(res.getStatusCode() >= 200 && res.getStatusCode() < 300) {
				String responseBody = res.getBody();
				if (String.isNotBlank(responseBody)) {
					Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
					if (responseMap != null && responseMap.containsKey('id')) {
						return String.valueOf(responseMap.get('id'));
					}
				}
				return null;
			} else {
				System.debug('Error transaction not successful. Received status code: ' + res.getStatusCode() + ' and status ' + res.getStatus());
				return null;
			}
		} catch (Exception e) {
			System.debug('Error execution failed ' + e.getMessage());
			return null;
		}
	}

	/**
	 * Creates an issue in Jira
	 * @param issueWrapper The issue wrapper object containing all necessary data
	 * @return String The Jira issue key
	 *
	 * TODO: Implement this method to make a callout to Jira API to create an issue
	 * Reminder: Extract and return the issue key from the response
	 */
	public static String createIssue(JiraWrapper.IssueWrapper issueWrapper) {
		Http http = new Http();
		HttpRequest req = new HttpRequest();
		req.setEndpoint('callout:jiraAPI'); // TODO: may need to add to endpoint
		req.setMethod('POST');
		req.setHeader('Content-Type', 'application/json');

		Map<String, Object> issuePayload = issueWrapper.generateIssuePayloadMap();
		req.setBody(JSON.serialize(issuePayload));

		try {
			HttpResponse res = http.send(req);
			if(res.getStatusCode() >= 200 && res.getStatusCode() < 300) {
				String responseBody = res.getBody();
				if (String.isNotBlank(responseBody)) {
					Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
					if (responseMap != null && responseMap.containsKey('key')) {
						return String.valueOf(responseMap.get('key'));
					}
				}
				return null;
			} else {
				System.debug('Error transaction not successful. Received status code: ' + res.getStatusCode() + ' and status ' + res.getStatus());
				return null;
			}
		} catch (Exception e) {
			System.debug('Error execution failed ' + e.getMessage());
			return null;
		}
	}
}
