---
name: "Acceptance criteria"
description: "Generate an acceptance test comment to help other users test these changes."
---

### List touched or added flows and functionality

Define a list of all the flows touched or created. Also add other functionality that was touched.

Run through it and define user flows to test, to see if the functionality is working as expected.
Include user flows for changed functionality and new functionality. Make sure the list is exhaustive.

### Purge and combine

Go through the user flows to purge and combine:

1. Combine multiple smaller user flows into a single flow
    - if they can hook after each other and reuse the leftover state after the previous flow.
2. Purge a user flow of which the individual variants are already included in another scenario.
    - Not all combinatorial combinations need to be verified.
    - Only include a step in different flows if:
        - Steps after it in the flow depend on it
        - It is a different variant
        - It may behave differently due to different preceding steps

A user flow may include setup steps necessary to get to a state where the actually tested flow can start.

### Format

Display the flows in a markdown code block. This makes it easy to copy over.
Provide clickable links to starting points or actions if possible.

Each flow is titled using a ### Heading 3.
The steps (actions the user must take) are a numbered list. This also includes setup steps.
The validations are listed as an `a, b, c` list directly after the numbered step where the validation takes place.
Some steps (like setup steps) might not have validations, their result is part of a bigger whole and tested later in the
flow.

### Example

```markdown
### 1. Customer Login And Logout

1. Open the [Customer sign-in page](https://example.com/customer/sign_in) and submit the email address of an active
   customer.

   **a.** The sign-in page accepts the email.  
   **b.** A Customer confirmation email arrives in [the mailcatcher](http://localhost:1080).
   **c.** The email text and one-time access code are readable and correspond to the intended user.

2. Enter the one-time code in the same browser.

   **a.** The code signs the user in and takes them to the expected Customer destination.  
   **b.** The resulting session works for the Customer interface.

3. Sign out through the Customer interface.

   **a.** The user is no longer authenticated.
```