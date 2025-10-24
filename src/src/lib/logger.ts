import pino from "pino";

const isDev = process.env.NODE_ENV !== "production";

export const logger = pino(
  isDev
    ? pino.transport({
        target: "pino-pretty",
        options: { colorize: true, singleLine: false },
      })
    : undefined,
);

export default logger;
