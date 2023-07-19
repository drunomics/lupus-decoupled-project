<template>
    <div class="teaser-listing">
      <h2>Title: {{ title }}</h2>
      <div>
        <component :is="useDrupalCe().renderCustomElements(content)" />
      </div>
    </div>
  </template>
  
  <script setup lang="ts">
  const props = defineProps<{
    title: String;
    content?: Object;
  }>();
  </script>
