# Decentralized-Kinematic-Control-of-Multi-Segment-Soft-Continuum-Robots
This repository contains Matlab codes associated with the following research paper:

@inproceedings{lafmejani2020consensus,
  title={A Consensus Strategy for Decentralized Kinematic Control of Multi-Segment Soft Continuum Robots},
  author={Lafmejani, Amir Salimi and Farivarnejad, Hamed and Doroudchi, Azadeh and Berman, Spring},
  booktitle={2020 American Control Conference (ACC)},
  pages={909--916},
  year={2020},
  organization={IEEE}
}


This project proposes a novel decentralized approach to kinematic control of soft segmented continuum robots based on a consensus strategy. The robots under consideration deform in a plane according to a multi-segment Piecewise Constant Curvature (PCC) kinematic model in which each segment is represented as an equivalent rigid-link Revolute-Prismatic-Revolute (RPR) mechanism. In our approach, we assume that each segment of the robot is equipped with sensors to measure joint variables in its local coordinate frame and can communicate with its two adjacent segments. Our consensus-based decentralized control strategy provides an alternative to conventional control methods, which solve the inverse kinematic problem by using computationally intensive numerical methods to calculate the robot's Jacobian matrix at each time instant. We investigate the stability and convergence properties of proposed controllers for position regulation and trajectory tracking tasks and provide theoretical guarantees on the controllers' performance. We evaluate the controllers in simulation for scenarios in which the robot's tip must reach a certain position or follow a specified trajectory. We compare the performance of the position regulator for different controller gains, and we find that a simulated 15-link robot can track a complex reference trajectory with an average root-mean-square error of only 0.16% of the robot's initial length.
