import { createGcpLoggingPinoConfig } from "@google-cloud/pino-logging-gcp-config";
import pino from "pino";

const isLocal = process.env.NODE_ENV !== "production";

const transport = isLocal
  ? pino.transport({
      target: "pino-pretty",
      options: {
        colorize: true,
        translateTime: "yyyy-mm-dd HH:MM:ss.l o",
        ignore: "pid,hostname",
      },
    })
  : undefined;

export const logger = pino(
  createGcpLoggingPinoConfig() as pino.LoggerOptions,
  transport,
);

