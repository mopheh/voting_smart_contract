import type { Principal } from '@dfinity/principal';
export interface POLL {
  'getApplicants' : () => Promise<Array<string>>,
  'getCanisterId' : () => Promise<Principal>,
  'getCategory' : () => Promise<string>,
  'getVotes' : () => Promise<Array<Principal>>,
}
export interface _SERVICE extends POLL {}
