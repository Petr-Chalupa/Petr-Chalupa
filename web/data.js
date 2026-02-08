import fs from "fs";
import yaml from "js-yaml";

export default () => {
    const file = fs.readFileSync("../data.yaml", "utf8");
    return yaml.load(file);
};
