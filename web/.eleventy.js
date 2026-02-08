import fs from "fs";
import yaml from "js-yaml";

export default function (eleventyConfig) {
    const data = yaml.load(fs.readFileSync("../data.yaml", "utf8"));
    eleventyConfig.addGlobalData("data", data);

    eleventyConfig.addPassthroughCopy("img");
    eleventyConfig.addPassthroughCopy("main.css");

    return {
        dir: {
            input: ".",
            output: "../dist",
        },
    };
}
