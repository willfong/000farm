<template>
  <div class="bg-white pt-16 pb-20 px-4 sm:px-6 lg:pt-24 lg:pb-28 lg:px-8">
    <div
      class="relative max-w-lg mx-auto divide-y-2 divide-gray-200 lg:max-w-7xl"
    >
      <div>
        <h2
          class="text-3xl tracking-tight font-extrabold text-gray-900 sm:text-4xl"
        >
          000.farm
        </h2>
        <h3 class="text-xl text-gray-500">
          Briding technology solutions with the agriculture industry.
        </h3>
        <p class="text-red-400">
          Work in progress. Just need to get things started...
        </p>
      </div>
      <div class="mt-6 pt-10 grid gap-16 lg:grid-cols-2 lg:gap-x-5 lg:gap-y-12">
        <div v-for="article in articles" :key="article.path">
          <p class="text-sm text-gray-500">
            <time datetime="2020-03-16">{{ article.updatedAt }}</time>
          </p>
          <NuxtLink :to="article.path" class="mt-2 block">
            <p class="text-xl font-semibold text-gray-900">
              {{ article.title }}
            </p>
            <p class="mt-3 text-base text-gray-500">
              {{ article.description }}
            </p>
          </NuxtLink>
          <div class="mt-3">
            <NuxtLink
              :to="article.path"
              class="text-base font-semibold text-indigo-600 hover:text-indigo-500"
              >Read more</NuxtLink
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  async asyncData({ $content, params }) {
    const articles = await $content("")
      .only(["title", "updatedAt", "description", "publishdate"])
      .sortBy("updatedAt", "desc")
      .fetch();
    return { articles };
  },
};
</script>
