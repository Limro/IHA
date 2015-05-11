uint16_t zip(uint16_t[] data, uint8_t compressBits)
{
	uint16_t[] compressedData = {};
	uint8_t index;

	for(index = 0 ; index < sizeof(data) ; index = index+8)
	{
		uint8_t i;
		uint8_t[8] tmpData = {};

		for(i = 0 ; i < 8 ; i++)
		{
			//Extract 8 bytes of data
			tmpData[i] = data[index+i];
		}

		SliceBits(tmpData, compressBits);
		//Take x bytes, push them to function
	}
}

uint8_t[] SliceBits(uint8_t[] data, uint8_t compressBits)
{
	uint8_t i;
	uint8_t[sizeof(data)-1] workedData = {};
	uint8_t tmp;

	// workedData[0] = (data & 0b11111110);
	// tmp = data[1] >> 7;
	// workedData[0] |= (tmp & 0b00000001);

	// workedData[1] = ((data[1] >> 2)<<3);
	// tmp = data[2] >> 6;
	// workedData[1] |= (tmp & 0b00000011);
	
	workedData[0] = (( data[0] >> 1 ) << 1); // xxxx xxx0
	workedData[0] |= (data[1] >> 7);		 // xxxx xxxy
	
	for(i = 1; i < sizeof(data)-1; i++)
	{
		workedData[i] = (( data[i] >> i+1 ) << i+2);
		workedData[i] |= (data[i+1] >> 7-i);
	}
	return workedData;
}

1010 101
1010 101
1010 101
1010 101
1010 101
1010 101
1010 101
1010 101

1010 1011
0101 0110
1010 1101
0101 1010
1011 0101
0110 1010
1101 0101


		x
1010 1011
	   x
0101 0110
	  x
1010 1101
	 x
0101 1010
   x
1011 0101
  x
0110 1010
 x
1101 0101