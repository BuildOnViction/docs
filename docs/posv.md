# Proof-of-Stake Voting


We begin by describing the blockchain protocol in the ”stakeholder and voting” setting, where leaders are assigned to blockchain slots with probability proportional to their (fixed) initial stake and votes received from coin-holders which will be the effective stake distribution throughout the execution. To simplify our presentation, we abstract this leader (chairman and vice-chairman) selection process, treating it simply as an “ideal functionality” that faithfully carries out the process of randomly assigning masternodes to slots. In the following, we explain how to instantiate this functionality with a specific secure computation.

To start, as we are dealing with proof of stake consensus algorithm

Time, Slots, Epoch
....