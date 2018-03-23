import { TestBed, inject } from '@angular/core/testing';

import { CodewikiService } from './codewiki.service';

describe('CodewikiService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [CodewikiService]
    });
  });

  it('should be created', inject([CodewikiService], (service: CodewikiService) => {
    expect(service).toBeTruthy();
  }));
});
