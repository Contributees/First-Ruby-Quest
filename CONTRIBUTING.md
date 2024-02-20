# Contributing
Thank you for your interest in contributing to **First-Ruby-Quest**!
We welcome contributions from everyone, whether it's
- fixing a syntax error, improving style or grammar
- adding to the documentation
- reporting a bug
- implementing a feature
- suggesting a new feature.

## Installation

1. Clone the repository on GitHub after forking this repository: `git clone git@github.com:YOUR-GITHUB-USERNAME/First-Ruby-Quest.git`
2. Navigate into the project directory: `cd first-ruby-quest`
3. Install dependencies by running: `bundle install`
4. Set up the database by running: `rails db:setup`
5. Launch the development processes by running: `dev` (all processes incl. Redis and Sidekiq) or `front_dev` (only web server and css compiler)

## How to Contribute

### Reporting Bugs

If you encounter any bugs or issues with **First-Ruby-Quest**, please open a new issue on GitHub. Provide as much detail as possible, including steps to reproduce the issue, expected behavior, and actual behavior. Also screenshots are welcome.

### Feature Requests
If you have ideas for new features or improvements, we'd love to hear them! Please open a new issue on GitHub to discuss your ideas and gather feedback from the community.


### Submit a Pull Request

1. Fork this repository on GitHub and clone that repository on your local machine. If you haven't forked or cloned repositories before, please refer to [GitHub's help page](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo?tool=desktop)
2. Create a branch for your changes, commit your work, and push your changes to your fork.
3. Create a new Pull Request from your fork's branch to the main repository's main branch.

## Code Style Guidelines
Please follow the existing code style and conventions used throughout the project. If you're unsure about anything, feel free to ask for clarification.

To run RuboCop:

    $ bundle exec rubocop

## Testing
We use RSpec for testing. Please ensure that your changes are covered by tests. To run the test suite:

    $ bundle exec rspec
