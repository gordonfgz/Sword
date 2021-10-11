function PlayerActOutAnimation(_spriteAnimation, _endScript){
  state = PlayerStateAct;
  sprite_index = _spriteAnimation;
  animationEndScript = -1;
  localFrame = 0;
  image_index = 0;
  PlayerAnimateSprite();
}