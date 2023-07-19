<template>
    <article>
      <a :href="href">{{  excerpt }}</a>
    </article>
  </template>
  
  <script setup lang="ts">
  const props = defineProps<{
    href: string;
    excerpt: string;
  }>();
  </script>
  