# IAM Minimum Privilege Guidance

- Start with a dedicated deployment service account per environment.
- Grant only storage and service usage permissions required by the resources in the stack.
- Avoid broad roles such as `roles/editor`.
- Add role explanations next to new resources when the template is extended.
