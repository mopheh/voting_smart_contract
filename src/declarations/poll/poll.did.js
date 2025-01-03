export const idlFactory = ({ IDL }) => {
  const POLL = IDL.Service({
    'getApplicants' : IDL.Func([], [IDL.Vec(IDL.Text)], ['query']),
    'getCanisterId' : IDL.Func([], [IDL.Principal], ['query']),
    'getCategory' : IDL.Func([], [IDL.Text], ['query']),
    'getVotes' : IDL.Func([], [IDL.Vec(IDL.Principal)], ['query']),
  });
  return POLL;
};
export const init = ({ IDL }) => {
  return [IDL.Text, IDL.Vec(IDL.Text), IDL.Vec(IDL.Principal)];
};
