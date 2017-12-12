
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[LShank] = loadSynchronized('LF013212sync.BIN');
save LShank LShank

[RShank] = loadSynchronized('RF015227sync.BIN');
save RShank RShank

[LThigh] = loadSynchronized('LT162053sync.BIN');
save LThigh LThigh

[RThigh] = loadSynchronized('RT163060sync.BIN');
save RThigh RThigh

[trunk] = loadSynchronized('TR231135sync.BIN');
save trunk trunk

% % [sacrum] = loadSynchronized('SA231066sync.BIN');
% % save sacrum sacrum
