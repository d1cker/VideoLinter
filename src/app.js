
function initApp() {
  const app = new Vue({
    el: "#app",
    template: `<div>
      <p>Todo items:</p>
      <ol>
        <todo-item
          v-for="item in groceryList"
          :todo="item"
          :key="item.id"
        ></todo-item>
      </ol>
    </div>`,
    data: {
      groceryList: [
        { id: 0, text: "Vegetables" },
        { id: 1, text: "Cheese" },
        { id: 2, text: "Whatever else humans are supposed to eat" }
      ]
    }
  });

  console.log("initialized app", app);
}

Vue.component("todo-item", {
  props: ["todo"],
  template: `<li>{{ todo.text }}</li>`
});
