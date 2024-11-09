<script setup>
import { ref } from 'vue';
import { hello_world_backend } from 'declarations/hello_world_backend/index';

let greeting = ref('');
let names = ref([]);
let showNames = ref(false);

async function handleSubmit(e) {
  e.preventDefault();
  const target = e.target;
  const name = target.querySelector('#name').value;

  await hello_world_backend.greet(name).then((response) => {
    greeting.value = response;
  });
}

async function toggleNames() {
  // Toggle the visibility of the names list
  showNames.value = !showNames.value;

  if (showNames.value) {
    // Fetch the submitted names from the backend if list is being shown
    names.value = await hello_world_backend.getSubmittedNames();
  }
}
</script>

<template>
  <main>
    <img src="/logo2.svg" alt="DFINITY logo" />
    <br />
    <br />
    <form action="#" @submit="handleSubmit">
      <label for="name">Enter your name: &nbsp;</label>
      <input id="name" alt="Name" type="text" />
      <button type="submit">Click Me!</button>
    </form>
    <section id="greeting">{{ greeting }}</section>

    <button @click="toggleNames">
      {{ showNames ? 'Hide' : 'Show' }} All Names
    </button>

    <ul v-if="showNames">
      <li v-for="(name, index) in names" :key="index">{{ name }}</li>
    </ul>
  </main>
</template>
