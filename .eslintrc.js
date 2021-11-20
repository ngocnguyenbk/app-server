module.exports = {
  extends: [
    "eslint-config-airbnb-base",
    "eslint:recommended",
  ],
  env: {
    // this section will be used to determine which APIs are available to us
    // (i.e are we running in a browser environment or a node.js env)
    node: true,
    browser: true,
    jquery: true,
  },
  parserOptions: {
    parser: "babel-eslint",
  },
  rules: {
    semi: 0,
    quotes: [2, "single", { avoidEscape: true }],
    "object-curly-newline": 0,
    "no-debugger": process.env.NODE_ENV === "production" ? "error" : "off",
    "import/no-unresolved": 0,
    "no-underscore-dangle": 0,
    "func-names": 0,
    "no-shadow": ["error", { allow: ["state"] }],
    "no-unused-vars": [
      "error",
      {
        argsIgnorePattern: "error|dispatch|xhr|settings|status|event|result",
      },
    ],
    "no-param-reassign": 0,
    "import/extensions": [
      "error",
      "never",
      {
        jpg: "always",
        scss: "always",
      },
    ],
    "max-len": ["error", { code: 120 }],
  },
  settings: {
    "import/resolver": {
      webpack: {
        config: {
          resolve: {
            modules: ["app/javascript", "node_modules"],
          },
        },
      },
    },
  },
}
