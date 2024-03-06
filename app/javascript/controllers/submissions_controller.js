import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submissions"
export default class extends Controller {
  static targets = ["food", "sleep", "exercise"]

  connect() {
    const currentTime = new Date().getTime();
    const today = new Date();

    const sleep_prompt_time = new Date(today.getFullYear(), today.getMonth(), today.getDate(), 10, 0, 0);
    const sleepPromptTime = sleep_prompt_time.getTime();

    const exercise_prompt_time = new Date(today.getFullYear(), today.getMonth(), today.getDate(), 21, 0, 0);
    const exercisePromptTime = exercise_prompt_time.getTime();

    const breakfast_prompt_time = new Date(today.getFullYear(), today.getMonth(), today.getDate(), 11, 0, 0);
    const breakfastPromptTime = breakfast_prompt_time.getTime();

    const lunch_prompt_time = new Date(today.getFullYear(), today.getMonth(), today.getDate(), 15, 0, 0);
    const lunchPromptTime = lunch_prompt_time.getTime();

    const dinner_prompt_time = new Date(today.getFullYear(), today.getMonth(), today.getDate(), 20, 0, 0);
    const dinnerPromptTime = dinner_prompt_time.getTime();

    if (currentTime > breakfastPromptTime || currentTime > lunchPromptTime || currentTime > dinnerPromptTime ) {
      this.foodTarget.classList.toggle("hide")
    } else if (currentTime > sleepPromptTime) {
      this.sleepTarget.classList.toggle("hide")
    } else if (currentTime > exercisePromptTime) {
      this.exerciseTarget.classList.toggle("hide")
    }
  }

  show(event) {
    let goal = event.currentTarget.classList.value;
    goal = goal.replace("progress-circle-", "");

    if (goal === "food") {
      this.foodTarget.classList.toggle("hide")
    } else if (goal === "sleep") {
      this.sleepTarget.classList.toggle("hide")
    } else if (goal === "exercise") {
      this.exerciseTarget.classList.toggle("hide")
    }
  }
}
