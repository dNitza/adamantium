/** @type {import('tailwindcss').Config} */

const colors = require("tailwindcss/colors");

module.exports = {
  content: ["./app/templates/**/*.slim", "./public/assets/index.js"],
  theme: {
    fontSize: {
      xsm: '0.75rem',
      sm: '0.8rem',
      base: '1rem',
      xl: '1.25rem',
      '2xl': '1.563rem',
      '3xl': '1.953rem',
      '4xl': '2.441rem',
      '5xl': '3.052rem',
    },
    extend: {
      boxShadow: {
        'solid': `10px 10px 1px 2px`
      },
      typograpgy: {
        emphasis: {
          css: {
            em: {
              colors: colors.pink['400']
            },
            a: {
              colors: colors.red['100']
            }
          }
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
