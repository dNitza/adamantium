/** @type {import('tailwindcss').Config} */

const colors = require("tailwindcss/colors");

module.exports = {
  darkMode: "class",
  content: [
    "./public/*.html",
    "./app/views/**/*.rb",
    "./app/templates/**/*",
    "./slices/**/views/**/*.rb",
    "./slices/**/templates/**/*",
    "./app/decorators/*/decorator.rb",
  ],
  safelist: [
    {
      pattern:
        /bg-(yellow|orange|green|lime|blue|pink|purple|indigo|emerald)-(50|100|800|900)/,
      variants: ["hover", "dark"],
    },
    {
      pattern:
        /text-(yellow|orange|green|lime|blue|pink|purple|indigo|emerald)-(400)/,
      variants: ["hover", "dark"],
    },
  ],
  theme: {
    fontSize: {
      xsm: "0.75rem",
      sm: "0.8rem",
      base: "1rem",
      xl: "1.25rem",
      "2xl": "1.563rem",
      "3xl": "1.953rem",
      "4xl": "2.441rem",
      "5xl": "4.052rem",
      "6xl": "6.052rem",
      "7xl": "7.052rem",
      "8xl": "6rem",
    },
    extend: {
      gridTemplateColumns: {
        16: "repeat(16, minmax(0, 1fr))",
      },
      gridColumn: {
        "span-13": "span 13 / span 13",
        "span-14": "span 14 / span 14",
        "span-15": "span 15 / span 15",
        "span-16": "span 16 / span 16",
      },
      boxShadow: {
        solid: `10px 10px 1px 2px`,
      },
      typography: {
        DEFAULT: {
          css: {
            h1: {
              "font-weight": 500,
            },
            h2: {
              "font-weight": 500,
            },
            h3: {
              "font-weight": 500,
            },
            h2: {
              "font-weight": 500,
            },
          },
        },
        emphasis: {
          css: {
            em: {
              colors: colors.pink["400"],
            },
            a: {
              colors: colors.red["100"],
            },
          },
        },
      },
    },
  },
  plugins: [require("@tailwindcss/typography")],
};
