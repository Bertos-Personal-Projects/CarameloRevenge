using Godot;

namespace ZeldaRing.Nodes.Particle;

public partial class ParticleManager : Node2D
{
    [Export] public PackedScene HurtParticle;

    public void Instantiate()
    {
        var particleInstance = HurtParticle.Instantiate<GpuParticles2D>();
        GetTree().CurrentScene.CallDeferred(MethodName.AddChild, particleInstance);
        particleInstance.Position = GlobalPosition;
        particleInstance.Emitting = true;
        particleInstance.Finished += () => { particleInstance.QueueFree(); };
    }
}