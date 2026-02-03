
local AnimationService = {}

local animationCache = {};

function AnimationService.getAnimation(animator : Animator, animation : Animation)
	local loadedTracks = animationCache[animator];
	if not loadedTracks then
		loadedTracks = {};
		animationCache[animator] = loadedTracks;
		
		animator.Destroying:Once(function()
			animationCache[animator] = nil;
		end)
		
		animator.AncestryChanged:Connect(function(_, parent)
			if parent == nil then
				animationCache[animator] = nil;
			end
		end)
	end

	local track : AnimationTrack = loadedTracks[animation];
	
	if not track then
		track = animator:LoadAnimation(animation);
		track.Looped = animation:GetAttribute("Looped") or track.Looped;
		track.Priority = animation:GetAttribute("Priority") or track.Priority;		
		loadedTracks[animation] = track;
	end
	
	return track;
end

function AnimationService.playAnimation(animator : Animator, animation : Animation, ...)
	local track = AnimationService.getAnimation(animator, animation);
	
	track:Play(...);
	return track;
end

function AnimationService.stopAnimation(animator : Animator, animation : Animation, ...)
	local loadedTracks = animationCache[animator];
	if not loadedTracks then
		return;
	end

	local track = loadedTracks[animation];
	if track then
		track:Stop(...);
	end
end

return AnimationService
