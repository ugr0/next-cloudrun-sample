import { NextResponse } from "next/server";
import { logger } from "@/lib/logger";

export async function POST(request: Request) {
  try {
    const body = await request.json().catch(() => ({}));
    logger.info({ body }, "client-invoked-log");
    return NextResponse.json({ ok: true });
  } catch (err) {
    logger.error({ err }, "log-route-error");
    return NextResponse.json({ ok: false }, { status: 500 });
  }
}
