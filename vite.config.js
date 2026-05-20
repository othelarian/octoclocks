import { defineConfig } from "vite";
import { coffee } from "vite-plugin-coffee3";

console.log(coffee);

export default defineConfig({
  base: '',
  //entry: "src/app.coffee",
  //dest: "app.js",
  modulePreload: false,
  plugins: [
    coffee(),
  ],
});
