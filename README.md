# Care Key

<a href="https://ibb.co/M6Jx3LZ"><img src="https://i.ibb.co/YZVFqGP/Design-sem-nome-1.png" alt="Design-sem-nome-1" border="0" width="100%"></a>


## Introduction

Welcome to Care Key, your personal companion for self-care and motivation. Care Key is designed to help you take better care of yourself by providing reminders, motivation, and tracking for essential daily tasks such as sleep, nutrition, exercise, and more. With customizable features and a reward system, Care Key makes self-care fun and engaging.

## Demo

Check out the live demo of Care Key [here*](https://www.carekey.beauty/). 

*Mobile ONLY, please use inspector

## Features

- **Task Reminders:** Receive timely reminders for essential tasks like sleeping properly, eating meals, and exercising.
- **Customizable Tasks:** Add your own tasks and set personalized reminders to suit your needs.
- **Progress Tracking:** Visualize your progress throughout the week to stay motivated and on track.
- **Reward System:** Earn coins for completing tasks and use them to customize your character with different clothes, accessories, and hairstyles.
- **Personalized Avatar:** Choose from a variety of customization options to create a character that represents you.
- **In-App Shop:** Explore the shop to find new items and customize your character using the coins you earn.

## Getting Started
### Setup

Install gems
```
bundle install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built with

- **Frontend:** Figma, HTML, [SCSS](https://sass-lang.com/guide/), [Bootstrap](https://getbootstrap.com/)
- **Backend:** [Rails 7](https://guides.rubyonrails.org/)
- **Deployment:** [Heroku](https://heroku.com/)
- **Database:** [PostgreSQL](https://www.postgresql.org/)
- **Additional Libraries:** [Stimulus JS](https://stimulus.hotwired.dev/), [Devise](https://github.com/heartcombo/devise)


## Usage

1. Sign up for an account or log in if you already have one.
2. Customize your avatar and explore the shop.
3. Add tasks and set reminders for each one.
4. Complete tasks and earn coins.
5. Use coins to purchase items from the shop and further customize your avatar.
6. Track your progress and stay motivated on your self-care journey!

## Future Updates

We're continuously working on improving Care Key to provide you with the best self-care experience. Here are some features we plan to implement in future updates:

- **Responsiveness:** Enhance the responsiveness of the application to ensure optimal user experience across various devices and screen sizes.
- **Additional Features:** Introduce new features and functionalities to further enhance the self-care experience, such as personalized moos tracker, water reminder and so on.
- **Line Notifications:** Implement Line notifications to provide users with timely reminders and motivational messages directly to their Line accounts.
- **Badges:** Introduce a badge system to reward users for achieving milestones and staying consistent with their self-care routines.

Stay tuned for these exciting updates!

If you have any feature requests or suggestions for future updates, feel free to share them with us. Your feedback is invaluable in shaping the future of Care Key.


## Team

Meet the team behind Care Key:

- **Sarah Amour** - *Front-end Lead*, *Project Manager*
  - LinkedIn: [Sarah's LinkedIn Profile](https://www.linkedin.com/in/sarah-amour-3779aa175/)
- **Hellen Tamara Naito** - *Lead Developer*
  - LinkedIn: [Hellen's LinkedIn Profile](https://www.linkedin.com/in/hellen-tamara-naito/)
- **Go Suzuki** - *Back-end*
  - Github: [Go's Github Profile](https://github.com/gosuz)
- **Karenina Wongsordjo** - *Api Specialist*
  - LinkedIn: [Karenina's LinkedIn Profile](https://www.linkedin.com/in/karenina-wongsordjo-b38501176/)


Feel free to reach out to any team member for inquiries, feedback, or collaboration opportunities.


Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
