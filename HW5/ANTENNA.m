classdef antenna < matlab.System
    % untitled2 Add summary here
    %
    % This template includes the minimum set of functions required
    % to define a System object with discrete state.
    
    % Public, tunable properties.
    properties
        
    end
    
    properties (DiscreteState)
        
    end
    
    % Pre-computed constants.
    properties (Access = private)
        
    end
    
    methods (Access = protected)
        function setupImpl(obj,u)
            % Implement tasks that need to be performed only once,
            % such as pre-computed constants.
        end
        
        function y = stepImpl(obj,u)
            % Implement algorithm. Calculate y as a function of
            % input u and discrete states.
            y = u;
        end
        
        function resetImpl(obj)
            % Initialize discrete-state properties.
        end
    end
end
