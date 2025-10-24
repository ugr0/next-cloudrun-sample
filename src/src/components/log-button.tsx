"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";

export function LogButton() {
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<string | null>(null);

  async function handleClick() {
    setLoading(true);
    setResult(null);
    try {
      const res = await fetch("/api/log", { method: "POST", body: JSON.stringify({ time: Date.now() }) });
      const data = await res.json();
      setResult(JSON.stringify(data));
    } catch (err: any) {
      setResult(String(err?.message ?? err));
    } finally {
      setLoading(false);
    }
  }

  return (
    <div>
      <Button onClick={handleClick} disabled={loading}>
        {loading ? "Logging..." : "Send server log"}
      </Button>
      {result && <div className="mt-2 text-sm">{result}</div>}
    </div>
  );
}

export default LogButton;
