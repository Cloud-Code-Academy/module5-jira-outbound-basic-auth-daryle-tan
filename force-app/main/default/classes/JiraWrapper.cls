/**
 * Wrapper classes for Jira entities (Project and Issue)
 */
public class JiraWrapper {
	private static final String LEAD_ACCOUNT_ID = '630e3930b433b060db556230';
	private static final String PROJECT_TEMPLATE_KEY = 'com.pyxis.greenhopper.jira:basic-software-development-template';

	/**
	 * Wrapper for Jira Project
	 */
	public class ProjectWrapper {
		public String name;
		public String key;
		public String description;
		public String leadAccountId;
		public String projectTemplateKey;

		/**
		 * Constructor for ProjectWrapper
		 */
		public ProjectWrapper(String name, String key, String description) {
			this.name = name;
			this.key = key;
			this.description = description;
			this.leadAccountId = LEAD_ACCOUNT_ID;
			this.projectTemplateKey = PROJECT_TEMPLATE_KEY;
		}
	}

	/**
	 * Wrapper for Jira Issue
	 */
	public class IssueWrapper {
		public String name;
		public String key;
		public String description;
		public String projectKey;
		public String summary;
		public String issueType;

		/**
		 * Constructor for IssueWrapper
		 */
		public IssueWrapper(
			String projectKey,
			String summary,
			String description,
			String issueType
		) {
			this.projectKey = projectKey;
			this.summary = summary;
			this.description = description;
			this.issueType = (String.isNotBlank(issueType)) ? issueType : 'Task';
		}

		/**
		 * Convert IssueWrapper to a Map for serialization
		 *
		 * TODO: Implement this method to create a Map that represents
		 * the JSON payload needed for the Jira API. The Map should contain:
		 * - fields object with project information (key)
		 * - issuetype object with the issue type name
		 * - summary field
		 * - description field (formatted using formatDescription method)
		 * - Example:
		 */
		public Map<String, Object> generateIssuePayloadMap() {
			// Your implementation goes here
			Map<String, Object> fields = new Map<String, Object>();
			fields.put('project', new Map<String, Object>{'key' => this.projectKey});
			fields.put('issuetype', new Map<String, Object>{'name' => this.issueType});
			fields.put('summary', this.summary);
			fields.put('description', formatDescription(this.description));

			Map<String, Object> jsonPayload = new Map<String, Object>();
			jsonPayload.put('fields', fields);
			return jsonPayload;
		}

		/**
		 * Format description as per Jira Cloud API requirements
		 *
		 * TODO: Implement this method to format the description text
		 * according to Jira Cloud API requirements.
		 * - Create a Map with type="doc" and version=1
		 * - Add content array with paragraph object
		 * - Add text object inside paragraph content with the description
		 * - Example:
		 *   {
		 *     "description": {
		 *       "type": "doc",
		 *       "version": 1,
		 *       "content": [
		 *         {
		 *           "type": "paragraph",
		 *           "content": [
		 *             {
		 *               "type": "text",
		 *               "text": "Order entry fails when selecting supplier."
		 *             }
		 *           ]
		 *         }
		 *       ]
		 *     }
		 *   }
		 */
		private Map<String, Object> formatDescription(String descText) {
			Map<String, Object> convertedInnerContent= new Map<String, Object>{
				'type' => 'text',
				'text' => descText
			};

			Map<String, Object> convertedOuterContent = new Map<String, Object>{
				'type' => 'paragraph',
				'content' => new List<Object>{convertedInnerContent}
			};

			Map <String, Object> convertedDesc = new Map<String, Object>{
				'type' => 'doc',
				'version' => 1,
				'content' => new List<Object>{convertedOuterContent}
			};

			return convertedDesc;
		}
	}
}
