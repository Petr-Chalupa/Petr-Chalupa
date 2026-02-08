import yaml from "js-yaml";

export default function (eleventyConfig) {
    eleventyConfig.addDataExtension("yaml", (contents) => yaml.load(contents));

    eleventyConfig.addPassthroughCopy("img");
    eleventyConfig.addPassthroughCopy("main.css");

    return {
        dir: {
            input: ".",
            data: "..",
            output: "../dist",
        },
    };
}
