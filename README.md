# Cloud Code Academy - Integration Developer Program

## Lesson 4: Jira Integration with Salesforce (Part 1)

This assignment focuses on implementing integration between Salesforce and Jira, creating a foundation for bidirectional synchronization using Salesforce custom objects and the Jira API.

## 🎯 Learning Objectives

By the end of this lesson, you will be able to:

- Implement outbound callouts from Salesforce to Jira using Queueable Apex
- Create custom wrapper classes to handle Jira API payloads
- Configure proper authentication for Jira API integration
- Implement robust error handling for external system integration
- Follow separation of concerns pattern in integration development

## 📋 Assignment Overview

In this assignment, you will be implementing the foundation for a Jira integration with Salesforce. The application will create Jira projects and issues from corresponding Salesforce custom objects, using asynchronous processing techniques.

Your implementation must:

1. Make callouts to Jira when Jira Project and Jira Issue records are created in Salesforce
2. Use Queueable Apex for asynchronous processing of callouts
3. Create proper wrapper classes to handle Jira API payloads
4. Update Salesforce records with the corresponding Jira IDs after successful creation

## 🔨 Prerequisites

1. A Jira Cloud account (sign up at https://www.atlassian.com/software/jira/free)
2. Jira API Key for authentication
3. Properly configured Named Credential in your org (see Setup Instructions)

## ✍️ Assignment Tasks

Your tasks for this assignment include:

1. Implement `JiraAPIService` class for making callouts to Jira API
2. Complete the `JiraWrapper` class methods for handling Jira payloads
3. Complete the `JiraTriggerHelper` class to handle trigger operations
4. Implement the `JiraCalloutQueueable` class to make asynchronous callouts
5. Make sure the triggers correctly handle insert scenarios for both projects and issues

## 🔑 Jira API Key Setup

1. Log in to your Jira Cloud account
2. Click on your profile icon in the top-right corner
3. Select **Account Settings** from the dropdown menu
4. Navigate to the **Security** tab
5. Scroll down to the **API token** section
6. Click on **Create and manage API tokens**
7. Click **Create API token**
8. Give your token a meaningful name (e.g., "Salesforce Integration")
9. Copy and securely store the generated API token - you won't be able to see it again!
10. Use this token along with your email address for Basic Authentication in the Named Credential

## 🔍 Finding Your Jira Account ID

To obtain your Jira Account ID (needed for the Project Lead):

1. Log in to your Jira Cloud account
2. Click on your profile icon in the sidebar
3. Select **Profile** from the menu
4. Look at the URL in your browser - your Account ID is the alphanumeric string after the last slash
   Example: `https://your-domain.atlassian.net/people/5bb7ad0ccc53fd0760103780`
   Account ID: `5bb7ad0ccc53fd0760103780`
5. Update the `LEAD_ACCOUNT_ID` constant in the `JiraWrapper` class with your Account ID

## 🧪 Testing Your Implementation

Your implementation should:

- Successfully create Projects in Jira when Jira_Project\_\_c records are created in Salesforce
- Successfully create Issues in Jira when Jira_Issue\_\_c records are created in Salesforce
- Update the Salesforce records with the corresponding Jira IDs/keys
- Handle errors gracefully with proper error messaging

## 🎯 Success Criteria

Your implementation should:

- Make successful callouts to the Jira API
- Create Projects and Issues in Jira
- Update Salesforce records with Jira IDs/keys
- Follow Salesforce best practices for integration
- Include comprehensive error handling

## 💡 Tips

- Review the [Jira API documentation](https://developer.atlassian.com/cloud/jira/platform/rest/v3/intro/)
- Use the Developer Console debug logs to troubleshoot
- Test with mock responses before making actual API calls
- Pay attention to the JSON payload structure required by Jira

## 📚 Resources

- [Apex Developer Guide: Queueable Apex](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_queueable.htm)
- [Apex Developer Guide: Callouts from Triggers](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_triggers_bestpract.htm)
- [JSON Serialization in Apex](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_json_overview.htm)
- [Named Credentials in Salesforce](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm)
- [Jira API Documentation](https://developer.atlassian.com/cloud/jira/platform/rest/v3/intro/)

## 🏆 Extra Credit - Optional Challenge

Once you've completed the basic implementation, try these challenges:

1. Add support for updating existing Jira Projects and Issues
2. Implement error retry mechanism for failed callouts
3. Create a Lightning component to display Jira Projects and Issues
4. Add support for custom fields in Jira Issues

## ❓ Support

If you need help:

- Review the Jira API documentation
- Check the provided code structure for guidance
- Reach out to your instructor

---

Happy coding! 🚀

_This is part of the Cloud Code Academy Integration Developer certification program._

## Copyright

© 2025 Cloud Code. All rights reserved.

This software is provided under the Cloud Code Developer Kickstart Program License (CCDKPL) Version 1.0.
The software is licensed, not sold, and is intended for personal educational purposes only as part of the Cloud Code Developer Kickstart Program.

See the full license terms in LICENSE.md for more details regarding usage restrictions, ownership, warranties, and limitations of liability.
