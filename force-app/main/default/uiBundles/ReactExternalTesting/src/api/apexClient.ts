/**
 * Thin Apex client: POSTs to the AOS_RestBridge Apex REST endpoint, which
 * forwards to the AOS processor framework.
 *
 * Uses the SDK's fetch rather than the global one: Apex REST endpoints are
 * CSRF-protected on all methods, and the SDK's request interceptor supplies
 * the token. A bare fetch() is rejected with a 403.
 */
import { createDataSDK } from '@salesforce/platform-sdk';

const BRIDGE_PATH = '/services/apexrest/aos/execute';

export async function fetchProcessor<TData = unknown>(
  processor: string,
  request: object
): Promise<TData> {
  const sdk = await createDataSDK();

  const response = await sdk.fetch!(BRIDGE_PATH, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      processor: processor,
      requestJSON: JSON.stringify(request),
    }),
  });

  if (!response.ok) {
    throw new Error(`Apex bridge HTTP ${response.status}`);
  }

  const envelope = JSON.parse(await response.json());

  if (envelope.isValid !== true) {
    const msg = (envelope.errors ?? ['Unknown processor error']).join('; ');
    throw new Error(`Processor error: ${msg}`);
  }

  return envelope as TData;
}